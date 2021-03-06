import { PrimaryGeneratedColumn } from 'typeorm';

export default abstract class AbstractEntity {
    @PrimaryGeneratedColumn('uuid')
    id: string;
}
