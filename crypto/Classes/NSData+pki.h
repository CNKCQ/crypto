
#import <Foundation/Foundation.h>
#import "NSData+pki.h"

NS_ASSUME_NONNULL_BEGIN

enum {
    /* options for block ciphers */
    // zeroPadding noPadding
    kAESZeroPadding         = 0x0000,
    // pkcs7Padding or pkcs5Padding
    kAESPKCS7Padding        = 0x0001
    /* stream ciphers currently have no options */
};
typedef uint32_t KAESPadding;


@interface NSData (pki)
/**
 *  加密
 *
 *  @param key 公钥
 *  @param iv  偏移量
 *
 *  @return 加密之后的NSData
 */
- (nullable NSData *)AES128EncryptWithKey:(NSString *)key iv:(NSString *)iv padding: (KAESPadding)padding;
/**
 *  解密
 *
 *  @param key 公钥
 *  @param iv  偏移量
 *
 *  @return 解密之后的NSData
 */
- (nullable NSData *)AES128DecryptWithKey:(NSString *)key iv:(NSString *)iv padding: (KAESPadding)padding;

@end

NS_ASSUME_NONNULL_END

