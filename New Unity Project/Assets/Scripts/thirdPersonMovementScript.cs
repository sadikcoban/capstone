using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class thirdPersonMovementScript : MonoBehaviour
{
    // Start is called before the first frame update
    public Transform cam;
    public CharacterController controller;
    public float speed = 0.001f;
    public float turnSMoothTime = 10f;
    public float turnSMoothVelocity;

    void Start()
    {
        Cursor.lockState = CursorLockMode.Locked;
    }

    // Update is called once per frame
    void Update()
    {
        float horizontal = Input.GetAxisRaw("Horizontal");
        float vertical = Input.GetAxisRaw("Vertical");
        Vector3 dircetion = new Vector3(horizontal,0f,vertical).normalized;
        if (dircetion.magnitude>= 0.1f)
        {
            float targetAngle = Mathf.Atan2(dircetion.x,dircetion.z) * Mathf.Rad2Deg + cam.eulerAngles.y;
            float angle = Mathf.SmoothDampAngle(transform.eulerAngles.y,targetAngle,ref turnSMoothVelocity, turnSMoothTime);
            transform.rotation = Quaternion.Euler(0f, angle, 0f);
            Vector3 moveDir = Quaternion.Euler(0f,targetAngle,0f)* Vector3.forward;
            controller.Move(moveDir.normalized * speed *Time.deltaTime );

        }


    }
}
