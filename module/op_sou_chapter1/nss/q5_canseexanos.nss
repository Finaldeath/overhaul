// check whether or not Xanos can be seen

int StartingConditional()
{
    object oHench = GetObjectByTag("x0_hen_xan");
    float fDistance = GetDistanceBetween(OBJECT_SELF, oHench);
    if (oHench != OBJECT_INVALID && fDistance < 10.0)
    {
        return TRUE;
    }
    return FALSE;
}
