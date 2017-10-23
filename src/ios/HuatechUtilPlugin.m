#import "HuatechUtilPlugin.h"

@implementation CDVUtil

-(void)isFileExist:(CDVInvokedUrlCommand*)command{
    NSArray  *arguments = command.arguments;
    NSString *fileId;
    NSString  *fileName;
    NSString  *extension;
    if (!arguments || [arguments count] < 2) {
        NSLog(@"#### setTagsWithAlias param is less");
        return ;
    }else{
        fileId = arguments[0];
        fileName  = arguments[1];
        extension =  [fileName pathExtension];  //aaa.doc -> doc
    }
     NSString *storeName =[NSString stringWithFormat:@"%@.%@",fileId,extension];
    NSLog(@"####  fileId is %@, fileName is %@",fileId,fileName);

   // NSString *storeName =[NSString stringWithFormat:@"%@.%@",fileId,extension];
    NSString *tmpDir=[NSHomeDirectory() stringByAppendingPathComponent:@"tmp/files"];
    NSString *storFile = [tmpDir stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@",storeName]];
    //NSLog(@"####  storeName is %@,storeName);

   NSFileManager *fileManager = [NSFileManager defaultManager];
   BOOL result = [fileManager fileExistsAtPath:storFile];
    CDVPluginResult* pluginResult = nil;

   if (result) {
         pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
     } else {
         pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
     }


       [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}

@end
