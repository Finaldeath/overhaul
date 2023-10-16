void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_M1Q4ChefPasswordTold") == FALSE &&
       GetLocalInt(GetArea(OBJECT_SELF),"NW_G_M1Q4DChefDoorOpen"))
          SignalEvent(OBJECT_SELF,EventUserDefined(440));
}
