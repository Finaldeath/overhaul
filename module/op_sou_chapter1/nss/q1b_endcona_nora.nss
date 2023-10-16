//q1b_endcona_nora
void main()
{
    if (GetLocalInt(GetModule(),"X1_NORAHASBABY") == 1)
    {
        object oTargetAdam = GetWaypointByTag("wp_q1h_grave_adam");
        object oTargetNora = GetWaypointByTag("wp_q1h_post_nora");
        object oNora = GetObjectByTag("q1bnora");
        object oAdam = GetObjectByTag("q1hblake");
        object oDoor = GetObjectByTag("q1b_ext_blake");

        if (oAdam != OBJECT_INVALID)
        {
            AssignCommand(oAdam, SetIsDestroyable(TRUE));
            object oCorpse = GetObjectByTag("q1blakecorpse");
            DestroyObject(oCorpse);
            DestroyObject(oAdam);
        }
        AssignCommand(oNora, ActionMoveToObject(oDoor, TRUE,2.0));
        SetCommandable(FALSE, oNora);
        DestroyObject(oNora, 1.0);
        CreateObject(OBJECT_TYPE_CREATURE, "q1bnora", GetLocation(oTargetNora));
        //object oAdam1 = CreateObject(OBJECT_TYPE_CREATURE, "q1hblake", GetLocation(oTargetAdam));
        //SetLocalInt(oAdam1, "nHealed", 1);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q1badamhstone", GetLocation(oTargetAdam));
        object oBaby = GetObjectByTag("q1hbaby");
        int nCount;
        for (nCount = 1; nCount < 5; nCount++)
        {
            DestroyObject(oBaby);
            oBaby = GetObjectByTag("q1hbaby");
        }
        //Make sure there's no baby in the cradle
        object oCradle = GetObjectByTag("q1hcradle");
        object oCradleBabe = GetItemPossessedBy(oCradle, "q1hbaby");
        if (GetIsObjectValid(oCradleBabe) == TRUE)
            DestroyObject(oCradleBabe);
    }
}
