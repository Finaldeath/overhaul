// jump player to aghaaz

void main()
{
    object oPC = GetPCSpeaker();
    object oWP = GetWaypointByTag("q4c_wp_aghaaz_pc_jump");
    SetLocalInt(OBJECT_SELF, "JUMPED", 1);
    FadeToBlack(oPC);
    DelayCommand(2.0, AssignCommand(oPC, JumpToObject(oWP)));
    DelayCommand(3.0, FadeFromBlack(oPC));
    int i = 1;
    object oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        AssignCommand(oHench, JumpToObject(oWP));
        i++;
        oHench = GetHenchman(oPC, i);
    }
    //JumpToObject(oWP);
    DestroyObject(OBJECT_SELF, 4.0);
}
