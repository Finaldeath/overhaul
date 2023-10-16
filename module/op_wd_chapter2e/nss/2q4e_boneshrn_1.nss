//::///////////////////////////////////////////////
//:: Bone Altar Heartbeat
//:: 2Q4E_BONESHRN
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Controls the spawning of Bone Spirits.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 11, 2002
//:://////////////////////////////////////////////
#include "NW_I0_2Q4LUSKAN"

void CreateBoneSpirit(location lWay);
void RunSpiritRelease();
object GetNearestTransPoint(object oPC);
object GetRemainingValidNode();
void CreateYuanTi(location lLocal);

void main()
{
    int nPlot = GetLocalPlotIntFromCharacter(OBJECT_SELF);
    //Grave markers
    object oNode1 = GetObjectByTag("2Q4E_BoneTrans01");
    object oNode2 = GetObjectByTag("2Q4E_BoneTrans02");
    //Skull piles
    object oPortal1 = GetObjectByTag("2Q4E_BonePortal01");
    object oPortal2 = GetObjectByTag("2Q4E_BonePortal02");

    if(!GetIsObjectValid(oNode1) || !GetIsObjectValid(oNode2))
    {
        if(!GetIsObjectValid(oNode1) && !GetIsObjectValid(oNode2))
        {
            nPlot == 2;
            SetLocalPlotIntOnCharacter(OBJECT_SELF, 2);
        }
        else
        {
            nPlot == 1;
            SetLocalPlotIntOnCharacter(OBJECT_SELF, 1);
        }
    }

    if(nPlot == 0)
    {
        RunSpiritRelease();

        object oSpirit = GetObjectByTag("2Q4E_SpiritBone");
        object oWay = GetObjectByTag("2Q4E_Crypt01");
        location lWay = GetLocation(oWay);
        object oPC1 = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        object oClosestNode = GetNearestTransPoint(oPC1);

        if(!GetIsObjectValid(oSpirit))
        {
            effect eBeam1 = EffectBeam(VFX_BEAM_ODD, OBJECT_SELF, BODY_NODE_HAND);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam1, oNode1, 5.0);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam1, oNode2, 5.0);

            effect eBeam2 = EffectBeam(VFX_BEAM_ODD, oNode1, BODY_NODE_CHEST);
            effect eBeam3 = EffectBeam(VFX_BEAM_ODD, oNode2, BODY_NODE_CHEST);

            DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam2, oPortal1, 3.0));
            DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam3, oPortal2, 3.0));

            effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);
            DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lWay));
            DelayCommand(5.0, CreateBoneSpirit(lWay));
        }
    }
    else if(nPlot == 1)
    {
        RunSpiritRelease();
        object oNode = GetRemainingValidNode();
        effect eBeam1 = EffectBeam(VFX_BEAM_ODD, OBJECT_SELF, BODY_NODE_HAND);
        effect eBeam2 = EffectBeam(VFX_BEAM_ODD, oNode, BODY_NODE_CHEST);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam1, oNode);
        if(GetIsObjectValid(oNode1))
        {
           ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam2, oPortal1);
        }
        else
        {
           ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam2, oPortal2);
        }
    }
    else if(nPlot == 2)
    {
        int nCnt = 0;
        int nRandom;
        float fDelay;
        location lLocal;
        while(nCnt <= 15)
        {
            nRandom = d6();
            string sWayTag = "2Q4E_SOULBURST_0" + IntToString(nRandom);
            lLocal = GetLocation(GetWaypointByTag(sWayTag));
            effect eVis = EffectVisualEffect(VFX_IMP_FLAME_M);
            DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lLocal));
            fDelay += 0.5;
            nCnt++;
        }
        effect eFire = EffectVisualEffect(VFX_FNF_FIREBALL);
        DelayCommand(fDelay + 0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eFire, GetLocation(OBJECT_SELF)));
        DelayCommand(fDelay + 1.0, DestroyObject(OBJECT_SELF, 1.0));

        object oLight =  GetObjectByTag("2Q4_NecroPillar02");
        object oConjure = GetObjectByTag("2Q4E_Y_FAKE_02");
        lLocal = GetLocation(oConjure);
        effect eVis = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
        DestroyObject(oConjure, 0.5);
        DestroyObject(oLight, 0.5);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lLocal);
        DelayCommand(1.0, CreateYuanTi(lLocal));

        object oAlter = GetNearestObjectByTag("2Q4_GrvLight01");
        if(!GetIsObjectValid(oAlter))
        {
            effect eVis = EffectVisualEffect(286);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF));
        }

        //Insert screen shake visual if both ritual items are gone.
    }
}

void CreateBoneSpirit(location lWay)
{
    CreateObject(OBJECT_TYPE_CREATURE, "2Q4E_SpiritBone", lWay);
}

void RunSpiritRelease()
{
    int nRandom = d6();
    string sWayTag = "2Q4E_SOULBURST_0" + IntToString(nRandom);
    location lLocal = GetLocation(GetWaypointByTag(sWayTag));
    effect eVis = EffectVisualEffect(VFX_IMP_DEATH);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lLocal);

}

object GetNearestTransPoint(object oPC)
{
    object oNode1 = GetObjectByTag("2Q4E_BoneTrans01");
    object oNode2 = GetObjectByTag("2Q4E_BoneTrans02");
    float fDist1 = GetDistanceBetween(oPC, oNode1);
    float fDist2 = GetDistanceBetween(oPC, oNode2);

    if(GetIsObjectValid(oNode1))
    {
        if(GetIsObjectValid(oNode2))
        {
            if(fDist1 >= fDist2)
            {
                return oNode1;
            }
            else
            {
                return oNode2;
            }
        }
        else
        {
            return oNode1;
        }
    }
    else
    {
        if(GetIsObjectValid(oNode2))
        {
            return oNode2;
        }
    }
    return OBJECT_INVALID;
}

object GetRemainingValidNode()
{
    object oNode1 = GetObjectByTag("2Q4E_BoneTrans01");
    object oNode2 = GetObjectByTag("2Q4E_BoneTrans02");
    if(GetIsObjectValid(oNode1))
    {
        return oNode1;
    }
    else
    {
        return oNode2;
    }
}

void CreateYuanTi(location lLocal)
{
    CreateObject(OBJECT_TYPE_CREATURE, "2Q4E_YuanTiNecro", lLocal);
}
