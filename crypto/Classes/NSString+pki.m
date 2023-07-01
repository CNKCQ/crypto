

#import "NSString+pki.h"
#import "NSData+pki.h"


@implementation NSString (pki)


// CBC 类型 AES128 加密 No Padding || Zero Padding
+ (nullable NSString *)AES128ZeroPaddingEncrypt:(NSString *)plainText key:(NSString *)key iv:(NSString *)iv {
    if (plainText == nil || plainText.length < 1) {
        return plainText;
    }
    NSData* data = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSData *resultData = [data AES128EncryptWithKey:key iv:iv padding:kAESZeroPadding];
    // options 为 kNilOptions==0 表示不插入换行符
    return [resultData base64EncodedStringWithOptions:kNilOptions];
}

// CBC 类型 AES128 解密 No Padding || Zero Padding
+ (nullable NSString *)AES128ZeroPaddingDecrypt:(NSString *)cipherText key:(NSString *)key iv:(NSString *)iv {
    if (cipherText == nil || cipherText.length < 1) {
        return cipherText;
    }
    NSData *data = [[NSData alloc] initWithBase64EncodedString:cipherText options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSData *resultData = [data AES128DecryptWithKey:key iv:iv padding:kAESZeroPadding];
    if (resultData) {
        return [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
    }
    return nil;
}

@end
