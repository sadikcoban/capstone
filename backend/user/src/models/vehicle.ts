import mongoose from "mongoose";

//an interface describing the properties
//required to create a user

interface VehicleAttrs {
  plate: string;
  user_id: string
}

//interface that describes properties
//a vehicle model has

interface VehicleModel extends mongoose.Model<VehicleDoc> {
  build(attrs: VehicleAttrs): VehicleDoc;
}

//interface that describes properties
//a user document has

interface VehicleDoc extends mongoose.Document {
  plate: string;
  user_id: string
 
  }

const vehicleSchema = new mongoose.Schema({
  plate: {
    type: String,
    required: true,
  },
  user_id: {
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
      delete ret.__v

    }
  }
});


vehicleSchema.statics.build = (attrs: VehicleAttrs) => {
  return new Vehicle(attrs);
};

const Vehicle = mongoose.model<VehicleDoc, VehicleModel>("Vehicle", vehicleSchema);


export { Vehicle };
