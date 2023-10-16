//q2b_hb_cloneobj
//Keep the mirror clone(s) attacking their nearest target
void main()
{
    object oClone1 = GetObjectByTag("q2bclone1");
    int bDead1 = FALSE;
    int bDead2 = FALSE;
    //clone 1 - attack nearest target
    if (GetIsObjectValid(oClone1) == TRUE)
    {
        object oEnemy1 = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oClone1);
        AssignCommand(oClone1, ActionAttack(oEnemy1));
    }
    else
    {
        bDead1 = TRUE;
    }
    //clone 2 attack nearest target
    object oClone2 = GetObjectByTag("q2bclone2");
    if (GetIsObjectValid(oClone2) == TRUE)
    {
        object oEnemy2 = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oClone2);
        AssignCommand(oClone2, ActionAttack(oEnemy2));
    }
    else
    {
        bDead2 = TRUE;
    }

    //Else destroy the hb object
    if (bDead1 == TRUE && bDead2 == TRUE)
        DestroyObject(OBJECT_SELF);


}
