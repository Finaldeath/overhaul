void main()
{
    int n = GetLocalInt(OBJECT_SELF, "N_COMBINATION");

    SendMessageToPC(GetPCSpeaker(), "[Current combination of object is : " + IntToString(n));
}
