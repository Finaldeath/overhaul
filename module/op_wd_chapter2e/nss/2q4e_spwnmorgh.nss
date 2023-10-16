//::///////////////////////////////////////////////
//:: Spawn a Mummy
//:: 2Q4E_SPWMMORGH
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When an Evil Spirit and a Bone Spirit are
    in the spawn area then kill both and create
    a Mummy.  If one of the evil shrines has
    been destroyed then create a Tyrant Fog
    Zombie
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 11, 2002
//:://////////////////////////////////////////////

#include "NW_I0_2Q4LUSKAN"
void main()
{
    object oEnter = GetEnteringObject();
    if(GetTag(oEnter) == "2Q4E_SpiritBone" || GetTag(oEnter) == "2Q4E_ShrnSpir")
    {
        DestroyObject(oEnter, 45.0);
    }

    int nCrypt = GetLocalInt(GetArea(OBJECT_SELF), "NW_2Q4E_BARAM_INNER_PLOT");
    if(nCrypt == 1)
    {
        object oBoneAltar = GetNearestObjectByTag("2Q4E_BoneAlter");
        object oShrine = GetNearestObjectByTag("2Q4_GrvLight01");

        object oEvil = GetEnteringObject();
        int nPlot;
        object oMummyWay = GetNearestObjectByTag("2Q4E_MummySpawn");
        object oBone = GetNearestObjectByTag("2Q4E_SpiritBone");
        object oSpirit = GetNearestObjectByTag("2Q4E_ShrnSpir");
        object oMummy = GetNearestObjectByTag("2Q4_MUMMY",OBJECT_SELF, 2);
        object oZombie = GetNearestObjectByTag("NW_ZOMBTYRANT", OBJECT_SELF, 3);

        if(GetIsObjectValid(oBoneAltar) && GetIsObjectValid(oShrine))
        {
            if(!GetIsObjectValid(oMummy))
            {
                if(GetTag(oEvil) == "2Q4E_SpiritBone" || GetTag(oEvil) == "2Q4E_ShrnSpir")
                {
                    if(GetIsObjectValid(oBone) && GetDistanceBetween(oMummyWay, oBone) < 10.0)
                    {
                        nPlot++;
                    }
                    if(GetIsObjectValid(oSpirit) && GetDistanceBetween(oMummyWay, oSpirit) < 10.0)
                    {
                        nPlot++;
                    }
                    if(nPlot == 2)
                    {
                        DestroyObject(oBone, 0.5);
                        DestroyObject(oSpirit, 0.5);
                        effect eVis = EffectVisualEffect(VFX_FNF_DISPEL);
                        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oMummyWay));
                        CreateObject(OBJECT_TYPE_CREATURE, "2q4_mummy", GetLocation(oMummyWay));
                        //CreateObject(OBJECT_TYPE_CREATURE, "nw_zombtyrant001", GetLocation(oMummyWay));
                    }
                }
            }
        }
        else if(!GetIsObjectValid(oZombie))
        {
            if(GetTag(oEvil) == "2Q4E_SpiritBone" || GetTag(oEvil) == "2Q4E_ShrnSpir")
            {
                if(GetIsObjectValid(oBone) && GetDistanceBetween(oMummyWay, oBone) < 10.0)
                {
                    DestroyObject(oBone, 0.5);
                }
                else if(GetIsObjectValid(oSpirit) && GetDistanceBetween(oMummyWay, oSpirit) < 10.0)
                {
                    DestroyObject(oSpirit, 0.5);
                }
                effect eVis = EffectVisualEffect(VFX_FNF_DISPEL);
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oMummyWay));
                CreateObject(OBJECT_TYPE_CREATURE, "nw_zombtyrant001", GetLocation(oMummyWay));
            }
        }
    }
}
