using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using UnityEngine.EventSystems;

public  class sys:MonoBehaviour
{ 
    public static Hashtable S=new Hashtable();
    public static Hashtable I=new Hashtable();
    public static Hashtable R=new Hashtable();
    public static Hashtable H=new Hashtable();
    public static int version;
    public static int progress;
    public static int hp=5;
    public static int plot=0;
    Text hp;
    Text mp;
    Text mhp;
    Text mmp;
    Text name;
    Text heath;
    // Start is called before the first frame update
    void Start()
    {
    S.Add("new game","menu");
    S.Add("menu","main");
    }

    // Update is called once per frame
    void Update()
    {
        heath.text="hp:"+hp;
        if (Input.GetKeyDown(KeyCode.Space)){
            hp--;
        }
        
    }

    void settext(Text t,string s)
    {
        t.text="hp:"+hp;
        if (Input.GetKeyDown(KeyCode.Space)){
            hp--;
        }
        
    }
    public void onclick()
    {
      string name = EventSystem.current.currentSelectedGameObject.name;
      switch(name)
      {
          case "new game":
          SceneManager.LoadScene("main");
          break;
          case "menu":
          SceneManager.LoadScene("menu");
          break;
          /*
          default:"back" 
          statement();
          */
      }

    }


/* 
   void Start ()
     {
         GameObject o = GameObject.Find ("Canvas/menu");
         Button bu = (Button) btn.GetComponent<Button>();
         bu.onClick.AddListener (onClick);
         GameObject o = GameObject.Find ("Canvas/data");
         Button bu = (Button) btn.GetComponent<Button>();
         bu.onClick.AddListener (onClick);

     }


    void onClick ()
     { if(Input.GetButtonDown("menu"))
         Debug.Log ("click!");
     }
*/



}