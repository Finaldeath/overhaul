//* Changes the transition of the stairs so the
//* Player can reach the bottom level
void main()
{
    if(GetLocalInt(GetModule(),"M2Q2WaterLever") == 0)
        {
        SpeakString("*on*");
        SetLocalInt(GetModule(),"M2Q2WaterLever",1);
        }
    else if(GetLocalInt(GetModule(),"M2Q2WaterLever") == 1)
        {
        SpeakString("*off*");
        SetLocalInt(GetModule(),"M2Q2WaterLever",0);
        }
}
