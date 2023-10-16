// User defined events for the dracolich inner sanctum:// 101: create a bone golem

void CreateGolem(location lLoc)
{
    object oGolem = CreateObject(OBJECT_TYPE_CREATURE, "q3c_golem", lLoc);
    object oMaster = GetLocalObject(OBJECT_SELF, "GOLEM_MASTER");
    SetLocalObject(oGolem, "MASTER", oMaster);

}

void CreateGas(location lLoc, location lTarget)
{
    object oGas = CreateObject(OBJECT_TYPE_CREATURE, "q3_gasform", lLoc);
    //AssignCommand(oGas, ActionForceMoveToLocation(lTarget, TRUE, 5.0));
    SetLocalLocation(oGas, "TARGET", lTarget);
    AssignCommand(oGas, ClearAllActions());
    AssignCommand(oGas, ActionForceMoveToLocation(lTarget, TRUE, 5.0));
    DelayCommand(5.5, DestroyObject(oGas));

}
void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101)
    {
        object oBones = GetLocalObject(OBJECT_SELF, "BONES");
        location lLoc = GetLocation(oBones);
        effect eVis = EffectVisualEffect(VFX_IMP_HARM);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oBones));
        DelayCommand(0.5, CreateGolem(lLoc));
        DestroyObject(oBones, 0.5);
     }
     else if(nEvent == 102) // create gaseous form for the vampires
     {
         location lCreate = GetLocalLocation(OBJECT_SELF, "GAS_LOC");
         location lTarget = GetLocalLocation(OBJECT_SELF, "GAS_TARGET");
         DelayCommand(0.5, CreateGas(lCreate, lTarget));

     }
}
