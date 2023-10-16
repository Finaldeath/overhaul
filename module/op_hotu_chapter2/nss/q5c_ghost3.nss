// ghost trigger 3

void RunGhost(object oGhost)
{
    object oWP = GetNearestObjectByTag("q5c_wp_ghost3");
    AssignCommand(oGhost, ActionMoveToObject(oWP, TRUE));
    AssignCommand(oGhost, ActionDoCommand(DestroyObject(oGhost)));
    DelayCommand(1.0, SetCommandable(FALSE, oGhost));
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);


    int i = 1;
    float fDelay;
    object oGhost = GetNearestObjectByTag("q5_ghost3", OBJECT_SELF, i);
    DelayCommand(1.0, AssignCommand(oGhost, SpeakOneLinerConversation("q5c_ghost3")));

    while(oGhost != OBJECT_INVALID)
    {
        DelayCommand(fDelay, RunGhost(oGhost));
        i++;
        fDelay += 0.5;
        oGhost = GetNearestObjectByTag("q5_ghost3", OBJECT_SELF, i);
    }



}
