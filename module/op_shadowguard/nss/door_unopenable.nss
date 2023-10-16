void main()
{
    object oPC = GetLastDisturbed();

    if (GetIsPC(oPC))
        SendMessageToPC(oPC, "[This door has been barred and locked from the other side.  There doesn't seem to be a way to open it.");
}
