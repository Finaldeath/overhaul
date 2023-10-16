void main()
{
    if(GetLocalInt(GetModule(),"NW_G_PlotAldo") >= 20)
    {
        SpeakString("Aldo, help!",TALKVOLUME_SILENT_SHOUT);
    }
    if(GetLocalObject(OBJECT_SELF,"NW_L_Master") == GetLastAttacker())
    {
        SetLocalObject(OBJECT_SELF,"NW_L_Master",OBJECT_INVALID);
    }
    ActionMoveAwayFromObject(GetLastAttacker(),TRUE);
}
