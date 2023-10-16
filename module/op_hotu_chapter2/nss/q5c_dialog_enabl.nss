void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    SetLocalInt(GetArea(OBJECT_SELF), "CUTSCENE_PLAYING", 0);
}
