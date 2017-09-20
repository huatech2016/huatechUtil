package net.huatech.plugin;
import org.apache.cordova.CordovaArgs;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;
import org.json.JSONException;

import android.content.Context;

import java.io.File;


public class HuatechUtilPlugin extends CordovaPlugin {
    private CallbackContext callbackContext;
    @Override
    public boolean execute(String action, CordovaArgs args, CallbackContext callbackContext) throws JSONException {

        this.callbackContext = callbackContext;

        if (action.equals("isFileExist")) {
              String  fileId = args.getString(0);
              String  fileName = args.getString(1);
            isFileExist(fileId,fileName);
            return true;
        }
        return false;
    }

    private void isFileExist(String fileId, String fileName )
    {
            String fileSuffix = fileName.substring(fileName.lastIndexOf(".") + 1);
            String realPath = cordova.getActivity().getExternalFilesDir("")  + File.separator + fileId +"."+ fileSuffix;

            File f = new File(realPath);
            if (f.exists()) {
                 callbackContext.success();//文件存在
            }else{
                 callbackContext.error(0);//文件不存在
            }
    }
}
