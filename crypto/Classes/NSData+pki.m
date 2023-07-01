

#import "NSData+pki.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation NSData (pki)

+ (NSData *)addZeroPadding: (NSData *)data {
    if (data == nil || data.length < 1) {
        return data;
    }
    NSUInteger dataLength = [data length];
    long diff = kCCKeySizeAES128 - (dataLength % kCCKeySizeAES128);
    NSMutableData *mutableData = [[NSMutableData alloc] initWithData:data];
    if (diff > 0 && diff < kCCKeySizeAES128) {
        char dataPtr[diff];
        for (int i = 0; i < diff; i++) {
            dataPtr[i] = 0x00;
        }
        NSData *zeroData = [NSData dataWithBytes:(const void *)dataPtr length:sizeof(unsigned char)*diff];
        [mutableData appendData:zeroData];
    }
    return [mutableData copy];
}

+ (NSData *)removeZeroPadding: (NSData *)data {
    if (data == nil || data.length < 1) {
        return data;
    }
    NSMutableData *mutableData = [[NSMutableData alloc] initWithData:data];
    NSUInteger size = [data length];
    NSUInteger tailSize = kCCKeySizeAES128 + 1;
    if (size < tailSize) {
        tailSize = size;
    }
    char dataPtr[tailSize];
    NSData *tailBuffer = [mutableData subdataWithRange:NSMakeRange(size - tailSize, tailSize)];
    memcpy(dataPtr, [tailBuffer bytes], tailSize);
    int i = 1;
    while (dataPtr[tailSize - i] == '\0') {
        i++;
    }
    return [mutableData subdataWithRange:NSMakeRange(0, size - i + 1)];
}


/**
 *  根据CCOperation，确定加密还是解密
 *
 *  @param operation kCCEncrypt -> 加密  kCCDecrypt－>解密
 *  @param key       公钥
 *  @param iv        偏移量
 *  @param padding       填充
 *
 *  @return 加密或者解密的NSData
 */
- (nullable NSData *)AES128Operation:(CCOperation)operation key:(NSString *)key iv:(NSString *)iv padding: (KAESPadding)padding
{
    char keyPtr[kCCKeySizeAES128 + 1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    char ivPtr[kCCBlockSizeAES128 + 1];
    memset(ivPtr, 0, sizeof(ivPtr));
    [iv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    NSData *data = self;
    if (operation == kCCEncrypt && padding == kAESZeroPadding) {
        data = [NSData addZeroPadding:data];
    }
    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(operation,
                                          kCCAlgorithmAES128,
                                          padding,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          ivPtr,
                                          [data bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesCrypted);
    
    if (cryptStatus == kCCSuccess) {
        if (operation == kCCDecrypt && padding == kAESZeroPadding) {
            return [NSData removeZeroPadding:[NSData dataWithBytesNoCopy:buffer length:numBytesCrypted]];
        }
        return [NSData dataWithBytesNoCopy:buffer length:numBytesCrypted];
    }
    free(buffer);
    return nil;
}

- (nullable NSData *)AES128EncryptWithKey:(NSString *)key iv:(NSString *)iv padding: (KAESPadding)padding;
{
    return [self AES128Operation:kCCEncrypt key:key iv:iv padding:padding];
}

- (nullable NSData *)AES128DecryptWithKey:(NSString *)key iv:(NSString *)iv padding: (KAESPadding)padding;
{
    return [self AES128Operation:kCCDecrypt key:key iv:iv padding:padding];
}

@end

