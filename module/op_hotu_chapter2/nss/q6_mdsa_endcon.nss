// Medusa end-con: resume buring books

void main()
{
    SetLocalInt(OBJECT_SELF, "STATUS", 1);
    int nCurrent = GetLocalInt(OBJECT_SELF, "CURRENT");
    nCurrent++;
    if(nCurrent == 10)
         nCurrent = 1;
    SetLocalInt(OBJECT_SELF, "CURRENT", nCurrent);
    string sTag = "q6c_wp_collect" + IntToString(nCurrent);
    object oWP = GetWaypointByTag(sTag);
    SpeakOneLinerConversation("q6c_meduda_ol");
    ActionMoveToObject(oWP);
    ActionDoCommand(SetLocalInt(OBJECT_SELF, "STATUS", 2));
    ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 3.0);
}
