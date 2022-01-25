using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using System;

public class CameraScript : MonoBehaviour
{
    // Start is called before the first frame update
    public int FileCounter = 0;
    public bool shot;
    public RenderTexture overviewTexture;
    public GameObject OVcamera;
    public string path = "";
    void Start()
    {
        shot = true;
        OVcamera = GameObject.FindGameObjectWithTag("photoCamera");
    }

    // Update is called once per frame
    /*void Update()
    {
        int second = System.DateTime.Now.Second;
        if (second % 30 == 0 && shot)
        {
            print(second.ToString());
            print("second");
            CamCapture();
        }
        if(second % 2 == 1 && !shot)
        {
            print(second.ToString());
            shot = true;
        }
    } */

    void LateUpdate()
    {
        int second = DateTime.Now.Second;
        if (second % 30 == 0 && shot)
        {
            StartCoroutine(TakeScreenShot());
        }
        if (second % 2 == 1 && !shot)
        {
            shot = true;
        }
    }
    void CamCapture()
    {

        ScreenCapture.CaptureScreenshot(FileCounter.ToString() + ".png");

        print("ScreenShot Alýndý");
        print(FileCounter.ToString() + ".png ScreenShot Alýndý");
        FileCounter++;

        shot = false;
    }

    public IEnumerator TakeScreenShot()
    {
        yield return new WaitForEndOfFrame();

        Camera camOV = OVcamera.GetComponent<Camera>();
        RenderTexture currentRT = RenderTexture.active;
        RenderTexture.active = camOV.targetTexture;
        camOV.Render();
        Texture2D imageOverview = new Texture2D(Screen.width, Screen.height, TextureFormat.RGB24, false);
        imageOverview.ReadPixels(new Rect(0, 0, Screen.width, Screen.height), 0, 0);
        imageOverview.Apply();
        RenderTexture.active = currentRT;

        // Encode texture into PNG
        byte[] bytes = imageOverview.EncodeToPNG();

        // save in memory
        string filename = fileName(Convert.ToInt32(imageOverview.width), Convert.ToInt32(imageOverview.height));
        path = Environment.GetFolderPath(Environment.SpecialFolder.Desktop)+ "\\" + filename;
        File.WriteAllBytes(path, bytes);
        print(path);
        shot = false;
    }
    // return file name
    string fileName(int width, int height)
    {
        return string.Format("screen_{0}x{1}_{2}.png",
                              width, height,
                              System.DateTime.Now.ToString("yyyy-MM-dd_HH-mm-ss"));
    }
}
