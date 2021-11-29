import mongoose from "mongoose";
import { Password } from "../services/password";

//an interface describing the properties
//required to create a user

interface UserAttrs {
  email: string;
  phone: string;
  name: string;
  surname: string;
  address: string;
  birthDate: string;
  balance: String;
  password: string;
}

//interface that describes properties
//a user model has

interface UserModel extends mongoose.Model<UserDoc> {
  build(attrs: UserAttrs): UserDoc;
}

//interface that describes properties
//a user document has

interface UserDoc extends mongoose.Document {
  email: string;
  phone: string;
  name: string;
  surname: string;
  address: string;
  birthDate: string;
  balance: String;
  password: string;
    
  }

const userSchema = new mongoose.Schema({
  email: {
    type: String,
    required: true,
  },
  phone: {
    type: String,
    required: true,
  },
  name: {
    type: String,
    required: true,
  },
  surname: {
    type: String,
    required: true,
  },address: {
    type: String,
    required: true,
  },birthDate: {
    type: String,
    required: true,
  },balance: {
    type: String,
    required: true,
  },password: {
    type: String,
    required: true,
  },
  createdAt: {
    type: Date,
    required: false,
    default: Date.now,
  }
 
}, {
  toJSON: {
    transform(doc,ret){
      ret.id = ret._id
      delete ret._id
      delete ret.password
      delete ret.__v

    }
  }
});

userSchema.pre('save', async function(done){
    if (this.isModified('password')) {
        const hashed = await Password.toHash(this.get('password'))
        this.set('password', hashed)
    }
    done()
})

userSchema.statics.build = (attrs: UserAttrs) => {
  return new User(attrs);
};

const User = mongoose.model<UserDoc, UserModel>("User", userSchema);


export { User };
