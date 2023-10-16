//::///////////////////////////////////////////////
//:: Name cutabort112
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Abort of betrayal of the Seer's Death
    Game over for the PC
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Sept 9/03
//:://////////////////////////////////////////////
void MakeAreaNeutral(object oPC);
void PCGameOver();
int PickVictoryAnimation();
float RandomDelay();

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    if(GetIsPossessedFamiliar(oPC))
        oPC = GetMaster(oPC);

    MakeAreaNeutral(oPC);


    BlackScreen(oPC);
    //FadeFromBlack(oPC, FADE_SPEED_FAST);

    PCGameOver();
}

//Change all creatures in the Area to Neutral
//Good Creatures will run for the hills
//Evil Creatures will cheer
void MakeAreaNeutral(object oPC)
{

    object oArea = GetArea(oPC);
    //object oPlayer = GetFirstPC();


    location lSpawn = GetLocation(GetWaypointByTag("cut112wp_factionstart"));
    object oFactionBoy = CreateObject(OBJECT_TYPE_CREATURE, "x2_factionboy", lSpawn);
    DestroyObject(oFactionBoy, 10.0);

    string szTag;
    string szReb= "q2abat2reb";

    int nAnimation;
    object oCreature = GetFirstObjectInArea(oArea);
    while (GetIsObjectValid(oCreature) == TRUE)
    {
        //Make sure its a creature
        if (GetObjectType(oCreature) == OBJECT_TYPE_CREATURE)
        {
            //But not the PC or a henchman
            if (GetIsPC(oCreature) == FALSE && GetAssociateType(oCreature) != ASSOCIATE_TYPE_HENCHMAN)
            {
                ChangeFaction(oCreature, oFactionBoy);
                AssignCommand(oCreature, ClearAllActions(TRUE));
                szTag = GetTag(oCreature);
                //Evil Creatures cheer (except the Seer and Tebomir)

                if (GetStringLeft(szTag, 10) == szReb)
                {
                    DelayCommand(2.0, AssignCommand(oCreature, ActionMoveAwayFromObject(oPC, TRUE)));
                    DestroyObject(oCreature, 5.0);

                }
                else if (GetIsObjectValid(GetMaster(oCreature)) == FALSE)
                {
                    nAnimation = PickVictoryAnimation();
                    AssignCommand(oCreature, ActionPlayAnimation(nAnimation));
                    nAnimation = PickVictoryAnimation();
                    DelayCommand(3.0 + RandomDelay(), AssignCommand(oCreature, ActionPlayAnimation(nAnimation)));
                    nAnimation = PickVictoryAnimation();
                    DelayCommand(8.0 + RandomDelay(), AssignCommand(oCreature, ActionPlayAnimation(nAnimation)));

                }
            }
        }

        oCreature = GetNextObjectInArea(oArea);
    }
}
//PC no longer jumps to Matron
//Death of the Seer is End of Game for the PC
void PCGameOver()
{

    //object oTarget = GetObjectByTag("wp_q2a9_pcsiegeoffer");
    effect eDeath = EffectDeath();
    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC) == TRUE)
    {
        //AssignCommand(oPC, JumpToObject(oTarget));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oPC);
        //Pop up the Death Gui
        //PopUpDeathGUIPanel(oPC, FALSE , TRUE, 85568);
        oPC = GetNextPC();
    }


}
int PickVictoryAnimation()
{
    int nRandom = Random(3) + 1;
    int nAnimation;
    switch (nRandom)
    {
        case 1:    nAnimation = ANIMATION_FIREFORGET_VICTORY1;
                    break;
        case 2:    nAnimation = ANIMATION_FIREFORGET_VICTORY2;
                    break;
        case 3:    nAnimation = ANIMATION_FIREFORGET_VICTORY3;
                    break;
    }
    return nAnimation;
}
//Return a random delay up to 2.0 seconds
float RandomDelay()
{
    float fRandom = IntToFloat(Random(20)) / 10.0;
    return fRandom;

}
