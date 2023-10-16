// Spawn Attiz trigger:
// Create attiz at the neareast wp, and destroy the other attiz creation trigger and campfire

void main()
{
    object oPC = GetEnteringObject();
    while(!GetIsPC(oPC))
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oWP = GetNearestObjectByTag("q5b_wp_attiz_sp");
    object oTrig = GetNearestObjectByTag(GetTag(OBJECT_SELF));
    object oCampfire = GetNearestObjectByTag("q5b_campfire", OBJECT_SELF, 2);
    DestroyObject(oTrig);
    object oAttiz = CreateObject(OBJECT_TYPE_CREATURE, "q5b_attiz", GetLocation(oWP));
    AssignCommand(oAttiz, PlayAnimation(ANIMATION_LOOPING_SIT_CROSS, 1.0, 9999.9));
}
