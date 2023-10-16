void main()
{
    object oPC = GetExitingObject();

    if (GetIsPC(oPC))
    {
        DeleteLocalObject(oPC, "O_CURR_ROPE_OBJECT");
    }
}
