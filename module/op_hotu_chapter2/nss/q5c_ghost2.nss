// ghost trigger 3

void RunGhost(object oGhost, object oWP)
{
    SetCommandable(TRUE, oGhost);
    AssignCommand(oGhost, ActionMoveToObject(oWP, TRUE));
    AssignCommand(oGhost, ActionDoCommand(DestroyObject(oGhost)));
    DelayCommand(0.3, SetCommandable(FALSE, oGhost));
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
    object oWP4 = GetNearestObjectByTag("q5c_wp_ghost4_sp");
    object oWP5 = GetNearestObjectByTag("q5c_wp_ghost5_sp");
    object oWP6 = GetNearestObjectByTag("q5c_wp_ghost6_sp");
    object oWPRun4 = GetNearestObjectByTag("q5c_wp_ghost4_run");
    object oWPRun5 = GetNearestObjectByTag("q5c_wp_ghost5_run");
    object oWPRun6 = GetNearestObjectByTag("q5c_wp_ghost6_run");

    object oGhost4 = CreateObject(OBJECT_TYPE_CREATURE, "q5_ghost", GetLocation(oWP4));
    object oGhost5 = CreateObject(OBJECT_TYPE_CREATURE, "q5_ghost", GetLocation(oWP5));
    object oGhost6 = CreateObject(OBJECT_TYPE_CREATURE, "q5_ghost", GetLocation(oWP6));
    SetCommandable(FALSE, oGhost4);
    SetCommandable(FALSE, oGhost5);
    SetCommandable(FALSE, oGhost6);

    DelayCommand(0.9, SetCommandable(TRUE, oGhost4));
    DelayCommand(1.0, AssignCommand(oGhost4, SpeakOneLinerConversation("q5c_ghost2")));
    DelayCommand(1.1, SetCommandable(FALSE, oGhost4));
    DelayCommand(7.0, RunGhost(oGhost5, oWPRun5));
    DelayCommand(7.0, RunGhost(oGhost6, oWPRun6));
    DelayCommand(9.0, RunGhost(oGhost4, oWPRun4));



}
