//This tile needs to be a different height in the city than
//the fire tiles in the slave mines
// * Fire Tiles spawn in with fire effects on them
#include "inc_plot_func"

void main()
{
    if (GetLocalInt(OBJECT_SELF, "NW_L_ONCE") == 0)
    {
        // * spawn in Fire Tile at better Z depending on which area
        float fHeight;
        if(GetTag(GetArea(OBJECT_SELF)) == "q5dfireplane")
        {
            fHeight = 1.5;
        }
        else if (GetTag(GetArea(OBJECT_SELF)) == "q5d9flametongue")
        {
            fHeight = 1.15;
        }
        else
        {
            fHeight = 0.1;
        }
        location lNewLoc = GetAdjustLocation(fHeight, GetLocation(OBJECT_SELF));
        object oNew = CreateObject(OBJECT_TYPE_PLACEABLE, "q5firetile", lNewLoc);
        int nEffect = 350; //Random(2) + 1 + 348;
        effect eVis = EffectVisualEffect(nEffect);
        SetLocalInt(oNew, "NW_L_ONCE", 10);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oNew);
        DestroyObject(OBJECT_SELF);
    }

}
