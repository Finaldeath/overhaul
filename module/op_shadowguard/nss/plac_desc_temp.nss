void main()
{
    object oPC = GetLastUsedBy();
    string s = "";

    if (GetIsPC(oPC))
        SendMessageToPC(oPC, s);
}
