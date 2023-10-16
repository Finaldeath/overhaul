// ghost trigger 1

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    object oGhost1 = GetNearestObjectByTag("q5_ghost1");
    object oGhost2 = GetNearestObjectByTag("q5_ghost2");
    object oWP1 = GetNearestObjectByTag("q5c_wp_ghost1");
    object oWP2 = GetNearestObjectByTag("q5c_wp_ghost2");


    AssignCommand(oGhost1, ActionMoveToObject(oWP1, TRUE));
    AssignCommand(oGhost2, ActionMoveToObject(oWP2, TRUE));
    AssignCommand(oGhost1, ActionDoCommand(DestroyObject(oGhost1)));
    AssignCommand(oGhost2, ActionDoCommand(DestroyObject(oGhost2)));

    DelayCommand(2.0, AssignCommand(oGhost1, SpeakOneLinerConversation("q5c_ghost1")));
    DelayCommand(1.0, SetCommandable(FALSE, oGhost1));
    DelayCommand(1.0, SetCommandable(FALSE, oGhost2));

}
