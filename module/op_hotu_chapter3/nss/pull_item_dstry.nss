/////////////////////////////////////////////////////////////////////////////////////
// This simple script is needed to destroy a pullable treasure chest when it is closed.
// The reason for this is that the PC is not actually "pulling" the object, one is
// being created and the original is destroyed. A player could loot a chest, then pull
// it again to get more loot.
//
// Created by: Brad Prince
// 9-13-02
//
/////////////////////////////////////////////////////////////////////////////////////

void main()
{
   DestroyObject(OBJECT_SELF);
}
