//::///////////////////////////////////////////////
//:: Evil Shrine Light Heartbeat
//:: 2Q4E_EvilLght_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if their any Skeleton Acolytes, Skeleton
    mages or Skeleton Chieftains.  If no then the
    light changes to yellow and the spawning of
    undead spirits stops.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 11, 2002
//:://////////////////////////////////////////////
#include "NW_I0_2Q4LUSKAN"

void CreateGoodLight(location lWay);
void CreateSpiritShrine(location lWay);
void CreateYuanTi(location lLocal);

void main()
{
    int nPlot = GetLocalPlotIntFromCharacter(OBJECT_SELF);
    object oWay = GetWaypointByTag("2Q4E_Crypt02");

    if(nPlot == 0)
    {
        //Object used for creating new undead.
        object oSpirit = GetNearestObjectByTag("2Q4E_ShrnSpir");
        object oGhoul =  GetNearestObjectByTag("2Q4E_SummGhoul", OBJECT_SELF, 5);
        object oMummy = GetNearestObjectByTag("NW_MUMMY",OBJECT_SELF, 2);

        if(!GetIsObjectValid(oSpirit) && !GetIsObjectValid(oGhoul) && !GetIsObjectValid(oMummy))
        {

            CreateSpiritShrine(GetLocation(oWay));
        }

        //Object used in letting the spawning continue.
        object oAcolyte = GetNearestObjectByTag("2Q4E_Skeleton");
        object oMageSkel = GetNearestObjectByTag("2Q4E_MageAcolyte");

        if(!GetIsObjectValid(oAcolyte) && !GetIsObjectValid(oMageSkel))
        {
            effect eSummon = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eSummon, GetLocation(oWay));
            CreateObject(OBJECT_TYPE_CREATURE, "2q4d_cryptmummy", GetLocation(oWay));
            SetLocalPlotIntOnCharacter(OBJECT_SELF, 1);
        }
    }
    else if(nPlot == 1)
    {
        object oChief = GetNearestObjectByTag("2q4d_cryptmummy");
        if(!GetIsObjectValid(oChief))
        {
            effect eVis = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWay));

            effect eStrike = EffectVisualEffect(VFX_FNF_FIRESTORM);
            object oWayFlame = GetWaypointByTag("2q4_flamestrike");
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eStrike, GetLocation(oWay));

            CreateGoodLight(GetLocation(oWay));
            DestroyObject(OBJECT_SELF,0.5);

            object oAlter = GetNearestObjectByTag("2Q4E_BoneAlter");
            if(!GetIsObjectValid(oAlter))
            {
                effect eVis = EffectVisualEffect(286);
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF));
            }
            /*
            object oLight =  GetObjectByTag("2Q4_NecroPillar01");
            object oConjure = GetObjectByTag("2Q4E_Y_FAKE_01");
            location lLocal = GetLocation(oConjure);
            effect eSpawn = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
            DestroyObject(oConjure, 0.5);
            DestroyObject(oLight, 0.5);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eSpawn, lLocal);
            DelayCommand(1.0, CreateYuanTi(lLocal));
            */
        }
    }
}

void CreateGoodLight(location lWay)
{
    CreateObject(OBJECT_TYPE_PLACEABLE, "2Q4_GrvLight02",lWay);
}

void CreateSpiritShrine(location lWay)
{
    CreateObject(OBJECT_TYPE_CREATURE, "2q4e_shrnspir", lWay);
}

void CreateYuanTi(location lLocal)
{
    CreateObject(OBJECT_TYPE_CREATURE, "2q4e_yuanticonj", lLocal);
}
