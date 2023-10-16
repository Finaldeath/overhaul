#include "M1_Plot"
void main()
{
    switch(GetUserDefinedEventNumber())
    {
        case 10:
        {
            object oPyre = GetLocalObject(OBJECT_SELF,"NW_G_PyreToFlame");
            CreateObject(OBJECT_TYPE_PLACEABLE,"PLC_FLAMELARGE",GetLocation(oPyre));
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_FLAME_M),GetLocation(oPyre));
            SetLocalObject(OBJECT_SELF,"NW_G_PyreToFlame",OBJECT_INVALID);
        }
        break;
        case 599:
        {
            DestroyUndead(OBJECT_SELF);
        }
        break;
    }

}
