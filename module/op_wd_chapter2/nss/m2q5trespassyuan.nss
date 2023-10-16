void main()
{
    object oEntered = GetEnteringObject();

    if (GetLocalInt(oEntered,"NW_L_M2Q5RiddleA") == 0 && GetIsPC(oEntered))
    {
        SetLocalObject(GetArea(OBJECT_SELF),"NW_A_Trespasser",oEntered);
        SignalEvent(GetObjectByTag("M2Q05CYUANTI"),EventUserDefined(500));
    }
}
