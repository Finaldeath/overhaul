//::///////////////////////////////////////////////
//:: Amulet taken or placed on pedestal in the flagstones puzzle
//:: pedestal_dis
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When amulet is taken off the pedestal: disable all beams (and the dagerous way is now the safe one)
    When amulet is placed on pedestal: activate all beams (and they show the safe way)
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 6/2/2003
//:://////////////////////////////////////////////


void main()
{
    string sRayTargetTag = "Q2_ACID_RAY_TARGET";
    if(GetTag(GetInventoryDisturbItem()) == "x1ascalhorn") // only handling the cloak
    {
        int n = 1;
        // gem removed
        if(GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_REMOVED)
        {
            //removing all beam effects
            SetLocalInt(GetArea(OBJECT_SELF), "FLAGSTONES_STATUS", 1);
            object oTarget = GetNearestObjectByTag(sRayTargetTag);
            while(oTarget != OBJECT_INVALID && GetArea(oTarget) == GetArea(OBJECT_SELF))
            {
                effect eRay = GetFirstEffect(oTarget);
                while(GetIsEffectValid(eRay))
                {
                    if(GetEffectType(eRay) == EFFECT_TYPE_BEAM)
                        RemoveEffect(oTarget, eRay);
                    eRay = GetNextEffect(oTarget);
                }
                n++;
                oTarget = GetNearestObjectByTag(sRayTargetTag, OBJECT_SELF, n);
            }
        }
        // gem placed
        else if(GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_ADDED)
        {
            // fire the beams at the acid tiles
            SetLocalInt(GetArea(OBJECT_SELF), "FLAGSTONES_STATUS", 0);
            effect eRay = EffectBeam(VFX_BEAM_EVIL, OBJECT_SELF, BODY_NODE_CHEST);
            object oTarget = GetNearestObjectByTag(sRayTargetTag);
            while(oTarget != OBJECT_INVALID && GetArea(oTarget) == GetArea(OBJECT_SELF))
            {
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eRay, oTarget);
                n++;
                oTarget = GetNearestObjectByTag(sRayTargetTag, OBJECT_SELF, n);
            }
        }
    }
}
