void main()
{
    object oPC = GetExitingObject();
    if(!GetIsPC(oPC))
        return;
    int n = GetLocalInt(OBJECT_SELF, "PLAYERS_NUM");
    n--;
    SetLocalInt(OBJECT_SELF, "PLAYERS_NUM", n);
}
