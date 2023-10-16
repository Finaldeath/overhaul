void main()
{
if(GetLocalInt(GetArea(OBJECT_SELF),"M2Q2SpiderMotherCall") == 0)
    {
    SpeakString("*Scree!*");
    DelayCommand(6.0,SetLocalInt(GetArea(OBJECT_SELF),"M2Q2SpiderMotherCall",1));
    }
}
