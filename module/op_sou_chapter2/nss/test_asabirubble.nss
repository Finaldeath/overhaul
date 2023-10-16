void main()
{
    int iThrallCount = 1;
    object oThrall = GetObjectByTag("AsabiLooter", iThrallCount);
    while (oThrall != OBJECT_INVALID)
    {
        //Destroy the nearest rubble pieces
        object oRubble = GetNearestObjectByTag("AsabiRubble", oThrall);
        DestroyObject(oRubble);

        //Update Loop variables
        iThrallCount++;
        oThrall = GetObjectByTag("AsabiLooter", iThrallCount);
    }
}
