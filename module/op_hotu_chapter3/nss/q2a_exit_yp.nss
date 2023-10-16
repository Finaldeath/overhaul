void main()
{
    object oPC = GetExitingObject();
    if (GetIsPC(oPC))
    {
        SetLocalInt(oPC,"nLeftYP",1);
    }
}
