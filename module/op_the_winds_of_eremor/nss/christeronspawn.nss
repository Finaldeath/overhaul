//Saves the object Id of the NPC
//this is used in the trigger onExit script
void main()
{
    SetLocalObject(GetArea(OBJECT_SELF),"NW_G_" + GetTag(OBJECT_SELF),OBJECT_SELF);
}

