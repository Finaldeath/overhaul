void main()
{
    object oPC = GetLastClosedBy();
    if(!GetIsPC(oPC))
        return;
    ActionOpenDoor(OBJECT_SELF);
}
