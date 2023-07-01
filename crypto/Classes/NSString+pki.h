

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (pki)


// CBC 类型 AES128 加密 No Padding || Zero Padding
+ (nullable NSString *)AES128ZeroPaddingEncrypt:(NSString *)plainText key:(NSString *)key iv:(NSString *)iv;

// CBC 类型 AES128 解密 No Padding || Zero Padding
+ (nullable NSString *)AES128ZeroPaddingDecrypt:(NSString *)cipherText key:(NSString *)key iv:(NSString *)iv;

@end

NS_ASSUME_NONNULL_END
