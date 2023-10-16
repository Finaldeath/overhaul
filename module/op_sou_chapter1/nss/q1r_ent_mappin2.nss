//Enable mappin for elven crypt when PC enters
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        object oMapPin = GetWaypointByTag("mn_q1r_rumgutcave");

        SetMapPinEnabled(oMapPin, TRUE);
        DestroyObject(OBJECT_SELF);
    }
}
