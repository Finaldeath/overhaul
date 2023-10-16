
// * Grass Tiles spawn in with water effects on them
#include "inc_plot_func"

void main()
{
    if (GetLocalInt(OBJECT_SELF, "NW_L_ONCE") == 0)
    {
        // * spawn in Grass Tile at better Z
        location lNewLoc = GetAdjustLocation(0.10, GetLocation(OBJECT_SELF));
        object oNew = CreateObject(OBJECT_TYPE_PLACEABLE, "q5watertile", lNewLoc);
        int nEffect = 426;
        effect eVis = EffectVisualEffect(nEffect);
        SetLocalInt(oNew, "NW_L_ONCE", 10);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oNew);
        DestroyObject(OBJECT_SELF);
    }

}
