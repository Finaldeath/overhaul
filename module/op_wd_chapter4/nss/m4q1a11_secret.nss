void main()
{
    object oPC = GetPCSpeaker();
    object oWay = GetObjectByTag("WP_M4Q1A11_SECRET");
    AssignCommand(oPC,ActionJumpToObject(oWay));
}
