// destroy tomb of Kel-Garas when Rod is acquired:
// - shake screen
// - create some debris crashing
// - fade to black
// - jump all players in the temple or the tomb to the new oasis area (QA2_WP_TOMB_FLEE)
// - give a message to each of the above players

#include "x1_inc_plot"
#include "x0_i0_henchman"
#include "X0_INC_HENAI"

void CreateDebris(location lLoc)
{
    effect eDebris = EffectVisualEffect(353);
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eDebris, lLoc, 2.0);
}

void CreatePortal()
{
    object JumpWP = GetWaypointByTag("Q3B_WP_JUMP_PORTAL");
    CreateObject(OBJECT_TYPE_PLACEABLE, "jumpportal", GetLocation(JumpWP));
}

void RestoreDeadHenchman(object oHench, object oPC, object oWP)
{
    effect eHeal = EffectHeal(5);
    if(GetTag(GetArea(oHench)) == "q2d_TombofKelGaras" || GetTag(GetArea(oHench)) == "q2e_TombofKelGarasInnerCatacombs") // inside the tomb
    {
        if(oHench != OBJECT_INVALID && GetIsHenchmanDying(oHench))
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oHench);
            DelayCommand(6.0, DoRespawn(oPC, oHench));
            DelayCommand(6.5, AssignCommand(oHench, JumpToObject(oWP)));
        }
    }
}

void main()
{
    object oPC = GetEnteringObject();
    if(GetTag(oPC) == "Q2_KELGARAS2") // do not allow Kel-Garas to init the collapse
        return;
    //if(GetItemPossessedBy(oPC, "q2_rod_blight") == OBJECT_INVALID) // player has the rod
    //    return;
    if(GetPlot("Q2_JOURNAL_ROD") < 10)
        return;

    int nDoOnce = GetLocalInt(GetArea(OBJECT_SELF), "DO_COLLAPASE_TOMB_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(GetArea(OBJECT_SELF), "DO_COLLAPASE_TOMB_ONCE", 1);


    // ******************************************************************
    object oAli = GetObjectByTag("Q2A_ALI");
    int i = 1;
    object oBedine = GetNearestObjectByTag("Q2A_BEDINE", oAli, i);
    while(oBedine != OBJECT_INVALID)
    {
        i++;
        DestroyObject(oBedine);
        oBedine = GetNearestObjectByTag("Q2A_BEDINE", oAli, i);
    }
    DestroyObject(oAli);

    // create new Ali and warriors
    object oAliWP = GetWaypointByTag("Q2A_WP_ALI_SP");
    oAli = CreateObject(OBJECT_TYPE_CREATURE, "q2a_ali", GetLocation(oAliWP));
    i = 1;
    object oBedineWP = GetNearestObjectByTag("Q2A_WP_WARRIOR_SP", oAli, i);
    while(oBedineWP != OBJECT_INVALID)
    {
        i++;
        CreateObject(OBJECT_TYPE_CREATURE, "q2a_bedine", GetLocation(oBedineWP));
        oBedineWP = GetNearestObjectByTag("Q2A_WP_WARRIOR_SP", oAli, i);
    }
    // create boulders

    object oBoulderWP1 = GetNearestObjectByTag("Q2A_BOULDER_SP", oAli, 1);
    object oBoulderWP2 = GetNearestObjectByTag("Q2A_BOULDER_SP", oAli, 2);
    object oBoulderWP3 = GetNearestObjectByTag("Q2A_BOULDER_SP", oAli, 3);
    object oBoulderWP4 = GetNearestObjectByTag("Q2A_BOULDER_SP", oAli, 4);

    vector vPos3 = GetPosition(oBoulderWP3);
    vector vPos4 = GetPosition(oBoulderWP4);
    vPos3.z += 2.0;
    vPos4.z +=2.0;
    location lLoc3 = Location(GetArea(oBoulderWP3), vPos3, GetFacing(oBoulderWP3));
    location lLoc4 = Location(GetArea(oBoulderWP4), vPos4, GetFacing(oBoulderWP4));

    CreateObject(OBJECT_TYPE_PLACEABLE, "x0_cityrubble1", GetLocation(oBoulderWP1));
    CreateObject(OBJECT_TYPE_PLACEABLE, "x0_cityrubble1", GetLocation(oBoulderWP2));
    CreateObject(OBJECT_TYPE_PLACEABLE, "x0_cityrubble1", lLoc3);
    CreateObject(OBJECT_TYPE_PLACEABLE, "x0_cityrubble1", lLoc4);

   object oWP = GetWaypointByTag("Q2A_WP_TOMB_EXIT");

    // ******************************************************************

    //object oWP = GetWaypointByTag("QA2_WP_TOMB_FLEE");


    DelayCommand(9.0, AssignCommand(oAli, ActionStartConversation(oPC)));

    object oXanos = GetObjectByTag("x0_hen_xan");
    object oDorna = GetObjectByTag("x0_hen_dor");
    object oDeekin = GetObjectByTag("x0_hen_dee");

    // if a henchman is dead while the tomb is collapsing - restore him and jump outside
    RestoreDeadHenchman(oXanos, oPC, oWP);
    RestoreDeadHenchman(oDorna, oPC, oWP);
    RestoreDeadHenchman(oDeekin, oPC, oWP);


        effect eShake = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
        oPC = GetFirstPC();
        float x, y;
        float fDelay;
        int nRand;
        while(oPC != OBJECT_INVALID)
        {
            if(GetTag(GetArea(oPC)) == "q2d_TombofKelGaras" || GetTag(GetArea(oPC)) == "q2e_TombofKelGarasInnerCatacombs") // inside the tomb
            {
                // shake screen
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eShake, oPC);
                DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eShake, oPC));
                DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eShake, oPC));
                AssignCommand(oPC, PlaySound("as_an_rockfalgl1"));
                DelayCommand(1.5, AssignCommand(oPC, PlaySound("as_an_rockfalgl2")));
                DelayCommand(3.0, AssignCommand(oPC, PlaySound("as_an_rockfalgl1")));
                // random debris
                for(i = 1; i <= 20; i++)
                {
                    vector vPos = GetPosition(oPC);
                    x = IntToFloat(Random(20) - 10);
                    y = IntToFloat(Random(20) - 10);
                    vPos.z = 14.0;
                    vPos.x += x;
                    vPos.y += y;
                    location lLoc = Location(GetArea(oPC), vPos, 0.0);
                    nRand = Random(6);
                    fDelay = nRand * 1.0;
                    AssignCommand(oPC, ClearAllActions());
                    DelayCommand(fDelay, CreateDebris(lLoc));
                }
                DelayCommand(4.0, AssignCommand(oPC, SpeakStringByStrRef(40507)));
                DelayCommand(5.0, FadeToBlack(oPC, FADE_SPEED_FAST));
                DelayCommand(6.0, AssignCommand(oPC, JumpToObject(oWP)));
                DelayCommand(7.0, FadeFromBlack(oPC, FADE_SPEED_FAST));


            }
            oPC = GetNextPC();
        }
        DelayCommand(10.0, CreatePortal());
}

