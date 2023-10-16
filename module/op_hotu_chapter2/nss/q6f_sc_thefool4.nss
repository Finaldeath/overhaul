// Talking to the fool after defeating Sabal.

int StartingConditional()
{
    object oSabal = GetNearestObjectByTag("q6_sabal");
    return GetIsDead(oSabal) && GetLocalInt(OBJECT_SELF, "STATUS") == 3;
}
