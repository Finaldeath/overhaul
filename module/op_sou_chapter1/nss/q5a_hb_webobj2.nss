//::///////////////////////////////////////////////
//:: Name: q5a_hb_webobj2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On the very first heartbeat of this object
    create a non-harmful web mass effect around it.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 21/02
//:://////////////////////////////////////////////

void main()
{
     if(GetLocalInt(OBJECT_SELF, "nDone") != 1)
     {
        SetLocalInt(OBJECT_SELF, "nDone", 1);
        effect eWeb = EffectVisualEffect(VFX_DUR_WEB_MASS);
        //object oArea = GetArea(OBJECT_SELF);
        //vector vSelf = GetPosition(OBJECT_SELF);
        //vector vTarget = Vector(vSelf.x, vSelf.y, vSelf.z - 0.2);
        //location lTarget = Location(GetArea(OBJECT_SELF), vTarget, GetFacing(OBJECT_SELF));
        //DestroyObject(OBJECT_SELF, 1.0);
        //object oNewWeb =CreateObject(OBJECT_TYPE_PLACEABLE, GetTag(OBJECT_SELF), lTarget);

        //ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eWeb, lTarget);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eWeb, OBJECT_SELF);
        //AssignCommand(oArea, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eWeb, oNewWeb));

     }
}
