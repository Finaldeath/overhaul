//::///////////////////////////////////////////////
//:: os_trg_banter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Banter trigger
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Jan 2004
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oCal = GetNearestObjectByTag("os_hen_cal");
    object oKai = GetNearestObjectByTag("os_hen_kai");
    object oTrp = GetNearestObjectByTag("os_hen_trp");
    object oJab = GetNearestObjectByTag("os_hen_jab");
    object oPC = GetFirstPC();
    object oBant = OBJECT_INVALID;
    if(GetEnteringObject()== oPC)
    {
        if(GetIsObjectValid(oCal))
        //checks if Calibast is banter-able
        {
            if(GetIsObjectValid(oKai))
            {
                oBant = oKai;
            }
            else if(GetIsObjectValid(oTrp))
            {
                oBant = oTrp;
            }
            else if(GetIsObjectValid(oJab))
            {
                oBant = oJab;
            }
            if(oBant != OBJECT_INVALID)
            {
                if(GetLocalInt(oCal,"OS_HEN_BANTER")==0)
                {
                    os_StartBanter(oCal, oBant, 10);
                }
                else if(GetLocalInt(oCal,"OS_HEN_BANTER")==20)
                {
                    os_StartBanter(oCal, oBant,30);
                }
                else if(GetIsObjectValid(oKai))
                //checks if Kaidala is banter-able
                {
                    if(GetLocalInt(oKai,"OS_HEN_BANTER")==0)
                    {
                        os_StartBanter(oKai, oCal, 10);
                    }
                    else if(GetLocalInt(oKai,"OS_HEN_BANTER")==20)
                    {
                      os_StartBanter(oKai, oCal, 30);
                    }
                }
                else if(GetIsObjectValid(oTrp))
                //checks if Trip is banter-able
                {
                    if(GetLocalInt(oTrp,"OS_HEN_BANTER")==0)
                    {
                         os_StartBanter(oTrp, oCal, 10);
                    }
                    else if(GetLocalInt(oTrp,"OS_HEN_BANTER")==20)
                    {
                        os_StartBanter(oTrp, oCal, 30);
                    }
                }
                else if(GetIsObjectValid(oJab))
                //checks if Jaboli is banter-able
                {
                    if(GetLocalInt(oJab,"OS_HEN_BANTER")==0)
                    {
                        os_StartBanter(oJab, oCal, 10);
                    }
                    else if(GetLocalInt(oJab,"OS_HEN_BANTER")==20)
                    {
                        os_StartBanter(oJab, oCal, 30);
                    }
                }
            }
        }
        else if(GetIsObjectValid(oKai))
        //checks if Kaidala is banter-able
        {
            oBant = OBJECT_INVALID;
            if(GetIsObjectValid(oTrp))
            {
                oBant = oTrp;
            }
            else if(GetIsObjectValid(oJab))
            {
                oBant = oJab;
            }
            if(oBant != OBJECT_INVALID)
            {
                if(GetLocalInt(oKai,"OS_HEN_BANTER")==0)
                {
                    os_StartBanter(oKai, oBant, 10);
                }
                else if(GetLocalInt(oKai,"OS_HEN_BANTER")==20)
                {
                  os_StartBanter(oKai, oBant, 30);
                }
                else if(GetIsObjectValid(oTrp))
                //checks if Trip is banter-able
                {
                    if(GetLocalInt(oTrp,"OS_HEN_BANTER")==0)
                    {
                         os_StartBanter(oTrp, oKai, 10);
                    }
                    else if(GetLocalInt(oTrp,"OS_HEN_BANTER")==20)
                    {
                        os_StartBanter(oTrp, oKai, 30);
                    }
                }
                else if(GetIsObjectValid(oJab))
                //checks if Jaboli is banter-able
                {
                    if(GetLocalInt(oJab,"OS_HEN_BANTER")==0)
                    {
                        os_StartBanter(oJab, oKai, 10);
                    }
                    else if(GetLocalInt(oJab,"OS_HEN_BANTER")==20)
                    {
                        os_StartBanter(oJab, oKai, 30);
                    }
                }
            }
        }
        else if(GetIsObjectValid(oTrp))
        //checks if Trip is banter-able
        {
            if(GetIsObjectValid(oJab))
            {
                if(GetLocalInt(oTrp,"OS_HEN_BANTER")==0)
                {
                    os_StartBanter(oTrp, oJab, 10);
                }
                else if(GetLocalInt(oTrp,"OS_HEN_BANTER")==20)
                {
                  os_StartBanter(oTrp, oJab, 30);
                }
                else if(GetIsObjectValid(oJab))
                //checks if Jaboli is banter-able
                {
                    if(GetLocalInt(oJab,"OS_HEN_BANTER")==0)
                    {
                        os_StartBanter(oJab, oTrp, 10);
                    }
                    else if(GetLocalInt(oJab,"OS_HEN_BANTER")==20)
                    {
                        os_StartBanter(oJab, oTrp, 30);
                    }
                }
            }
        }
    }
}
