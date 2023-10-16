void main()
{
    object oPC = GetLastPerceived();
    if (GetIsObjectValid(oPC) &&
        GetIsPC(oPC))
    {
        ActionStartConversation(OBJECT_SELF);
        DestroyObject(OBJECT_SELF);
    }
}
