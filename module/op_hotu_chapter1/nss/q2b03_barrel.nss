//::///////////////////////////////////////////////
//:: q2b03_barrel
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks for placement of 2 Ales and 1 Fairy Dust in order
    to start the explosion timer

    June 2002: added the delays because a programming bug
     could not be fixed.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith W
//:: Created On: September 23/02
//:://////////////////////////////////////////////


float nTime = 7.0;

void main()
{

    ClearAllActions();
    object oFirst = OBJECT_INVALID;
    object oSecond = OBJECT_INVALID;
    object oThird = OBJECT_INVALID;
    object oFourth = OBJECT_INVALID;
    oFirst = GetFirstItemInInventory();
    oSecond = GetNextItemInInventory();
    oThird = GetNextItemInInventory();
    oFourth = GetNextItemInInventory();
    if(oFourth == OBJECT_INVALID)
    {
        object oSmoke = OBJECT_INVALID;

        // * test to see if the correct itmes have been placed in the barrel
        object oItem1 = GetItemPossessedBy(OBJECT_SELF,"q2b03FairyDust");
        object oItem2 = GetItemPossessedBy(OBJECT_SELF,"q2b03Ale1");
        object oItem3 = GetItemPossessedBy(OBJECT_SELF,"q2b03Ale2");
        if (GetIsObjectValid(oItem1) == TRUE && GetIsObjectValid(oItem2) == TRUE && GetIsObjectValid(oItem3) == TRUE)
        //    && GetLocalInt(OBJECT_SELF,"NW_L_ORDER") == 0)
        {
            //If the correct objects are in the barrel, start a timer and destroy the boulders.

            object oBoulder1 = GetObjectByTag("q2b03Boulder1");
            object oBoulder2 = GetObjectByTag("q2b03Boulder2");
            DestroyObject(oItem1, 0.1);
            DestroyObject(oItem2, 0.1);
            DestroyObject(oItem3, 0.1);
            DestroyObject(oBoulder1, 0.1);
            DestroyObject(oBoulder2, 0.1);

            effect eSmoke = EffectVisualEffect(VFX_FNF_DISPEL);
            location lSmoke = GetLocation(OBJECT_SELF);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eSmoke,lSmoke);
            DestroyObject(OBJECT_SELF,0.5f);
        }
    }



}
