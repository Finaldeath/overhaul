//Dragon opens the chest
void main()
{
    SetLocalInt(OBJECT_SELF, "q5_Negotiate1", 2);
    object oChest = GetObjectByTag("q5dragonchest");
    AssignCommand(oChest, ActionPlayAnimation(ANIMATION_PLACEABLE_OPEN));

}
