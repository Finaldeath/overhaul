void main()
{
    string sConv = "q3_succubi";
    object oPC = GetFirstPC();

    BeginConversation(sConv, oPC);
    AssignCommand(OBJECT_SELF, SetFacing(GetFacing(OBJECT_SELF)));
}
