// check whether or not Dorna can be seen

int StartingConditional()
{
    object oHench = GetObjectByTag("x0_hen_dor");
    float fDistance = GetDistanceBetween(OBJECT_SELF, oHench);
    if (oHench != OBJECT_INVALID && fDistance < 10.0)
    {
        return TRUE;
    }
    return FALSE;
}
